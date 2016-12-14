#include <iostream>

std::string swapCharacters(std::string word) {
    for (int i = 0; i < word.length(); i += 2) {
        if (word[i+1]) {
            char temp = word[i];
            word[i] = word[i + 1];
            word[i + 1] = temp;
        }
    }

    return word;
}

std::string xorString(std::string payload, char secret) {
    for (int i = 0; i < payload.length(); i++) {
        payload[i] ^= secret;
    }
    return payload;
}

int main() {
    /*
    std::string payload = "siema";
    char secret = 'a';
    std::string encrypted = xorString(payload, secret);
    std::cout << "Encrypted: " << encrypted << std::endl;
    std::cout << "Decrypted: " << xorString(encrypted, secret) << std::endl;
     */

    std::cout << swapCharacters("serwus") << std::endl;

    return 0;
}