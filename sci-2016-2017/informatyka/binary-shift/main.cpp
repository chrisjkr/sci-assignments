#include <iostream>

std::string xorString(std::string payload, char secret) {
    std::string shifted = "";
    for (int i = 0; i < payload.length(); i++) {
        int c;
        c = (int)payload[i] ^ (int)secret;
        shifted[i] = static_cast<char>(c);
    }
    return shifted;
}

int main() {
    std::string payload = "siema";
    char secret = 'a';
    std::string encrypted = xorString(payload, secret);
    std::cout << "Encrypted: " << encrypted << std::endl;
    std::cout << "Decrypted: " << xorString(encrypted, secret) << std::endl;
    return 0;
}