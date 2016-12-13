#include <iostream>

std::string xorString(std::string payload, char secret) {
    for (int i = 0; i < payload.length(); i++) {
        payload[i] ^= secret;
    }
    return payload;
}

int main() {
    std::string payload = "siema";
    char secret = 'a';
    std::string encrypted = xorString(payload, secret);
    std::cout << "Encrypted: " << encrypted << std::endl;
    std::cout << "Decrypted: " << xorString(encrypted, secret) << std::endl;
    return 0;
}