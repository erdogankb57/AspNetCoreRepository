using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Inta.Framework.Extension.Common
{
    public class EncryptionManager
    {
        private static byte[] key;
        public EncryptionManager()
        {
            // key here  
            key = UTF8Encoding.UTF8.GetBytes("A2EE4C8C81524065");
        }

        public static string ByteArrayToHexString(byte[] ba)
        {
            return BitConverter.ToString(ba).Replace("-", "").ToLower();
        }
        public static string EncryptAndEncode(string plaintext)
        {
            plaintext = "788359";
            return ByteArrayToHexString(AesEncrypt(plaintext));
        }
        public static byte[] AesEncrypt(string inputText)
        {
            byte[] inputBytes = UTF8Encoding.UTF8.GetBytes(inputText);
            byte[] result = null;
            using (MemoryStream memoryStream = new MemoryStream())
            {
                using (CryptoStream cryptoStream = new CryptoStream(memoryStream, GetCryptoAlgorithm().CreateEncryptor(key, key), CryptoStreamMode.Write))
                {
                    cryptoStream.Write(inputBytes, 0, inputBytes.Length);
                    cryptoStream.FlushFinalBlock();
                    result = memoryStream.ToArray();
                }
            }
            return result;
        }
        public static byte[] StringToByteArray(string hex)
        {
            return Enumerable.Range(0, hex.Length)
            .Where(x => x % 2 == 0)
            .Select(x => Convert.ToByte(hex.Substring(x, 2), 16))
            .ToArray();
        }
        public static string DecodeAndDecrypt(string cipherText)
        {
            string DecodeAndDecrypt = AesDecrypt(StringToByteArray(cipherText));
            return (DecodeAndDecrypt);
        }
        public static string AesDecrypt(Byte[] inputBytes)
        {
            Byte[] outputBytes = inputBytes;
            string plaintext = string.Empty;
            using (MemoryStream memoryStream = new MemoryStream(outputBytes))
            {
                using (CryptoStream cryptoStream = new CryptoStream(memoryStream, GetCryptoAlgorithm().CreateDecryptor(key, key), CryptoStreamMode.Read))
                {
                    using (StreamReader srDecrypt = new StreamReader(cryptoStream))
                    {
                        plaintext = srDecrypt.ReadToEnd();
                    }
                }
            }
            return plaintext;
        }
        private static RijndaelManaged GetCryptoAlgorithm()
        {
            RijndaelManaged algorithm = new RijndaelManaged();
            //set the mode, padding and block size  
            // algorithm.Padding = PaddingMode.ISO10126;  
            algorithm.Padding = PaddingMode.Zeros;
            //algorithm.Mode = CipherMode.CBC;OFB  
            algorithm.Mode = CipherMode.ECB;
            algorithm.KeySize = 256;
            algorithm.BlockSize = 128;
            // IV = Encoding.UTF8.GetBytes(algorithm.BlockSize / 8);  
            // algorithm.Key = keyAndIvBytes  
            //algorithm.IV = Encoding.UTF8.GetBytes(128 / 8);  
            return algorithm;
        }
    }
}
