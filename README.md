# Haskell Cryptography Library README

## Overview

This Haskell library provides a set of functions for basic cryptographic operations, including text sanitization, Caesar cipher encryption, unique character filtering, substitution cipher, and RSA encryption. It is designed for educational purposes to demonstrate the implementation of these cryptographic techniques in Haskell.

## Features

- **Sanitize**: Clean and transform input text by removing non-letter characters and converting letters to uppercase.
- **Caesar Cipher**: Encrypt text using a simple shift-based method.
- **Unique Character Filtering**: Eliminate duplicate characters from a string, retaining only the first occurrence of each character.
- **Substitution Cipher**: Encrypt text using a pangram-based substitution method.
- **RSA Encryption**: Encrypt and decrypt messages using RSA, a more secure encryption method based on block processing.

## Installation

Ensure you have GHC (Glasgow Haskell Compiler) or Stack installed on your system to compile and run Haskell programs. This library does not require external dependencies outside of the Haskell Platform.

## Usage

### Importing the Library

Start by importing the module in your Haskell script:

```haskell
import Data.Char -- Required for character manipulation functions
```

### Sanitize Text

```haskell
let sanitizedText = sanitize "Your Text Here!"
```

### Caesar Cipher Encryption

```haskell
let encryptedText = caesar 3 "Sanitized Text Here" -- Shifts characters by 3
```

### Filter Unique Characters

```haskell
let uniqueChars = keepFirst "Your Text Here"
```

### Substitution Cipher

Encrypt and decrypt using a pangram for substitution:

```haskell
let cipherText = substEncipher "The quick brown fox jumps over the lazy dog" "Message"
let plainText = substDecipher "The quick brown fox jumps over the lazy dog" cipherText
```

### RSA Encryption

Encrypt and decrypt messages using RSA:

```haskell
let publicKey = (e, n)
let privateKey = (d, n)
let encodedMessage = encodeString publicKey "Your Message Here"
let decodedMessage = decodeString privateKey encodedMessage
```

### Square and Power Modulo Operations

```haskell
let squareModResult = squareMod b n
let powerModResult = powerMod b e n
```

### Message and Integer Conversion

Convert messages to integers for RSA encryption and back:

```haskell
let messageAsInteger = messageToInteger "Your Message Here"
let messageFromString = integerToMessage messageAsInteger
```

## Contributing

Contributions are welcome! Please fork the repository and submit pull requests with your enhancements. Ensure your code adheres to Haskell best practices.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
