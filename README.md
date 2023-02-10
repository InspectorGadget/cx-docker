# CX Oracle Installer through Docker

---

## Save your time?

| Name              | Link                                                                          |
| ----------------- | ----------------------------------------------------------------------------- |
| For Intel         | [Click here](https://github.com/InspectorGadget/cx-docker)                    |
| For Apple Silicon | [Click here](https://github.com/InspectorGadget/cx-docker/tree/apple-silicon) |

---

## Introduction

Installing CX Oracle has been a "pain" for many of us (Including me), who even wants to waste their time on setting up CX Oracle from scratch right? I've gone ahead to make your life a little easier with this easy to use Docker File / Bash Script.

All you got to do, is to follow the steps below.

## Steps (Intel - x86_64)

1. Install Docker on your machine.
   - You may need to also install Docker Compose. Some distro doesn't have Docker Compose pre-installed.
2. Clone this repository.
3. Open your terminal and navigate to the cloned repository (Tip: `cd`).
4. Change the file permission of `install.sh` to executable. (Tip: `chmod +x install.sh`)
5. Run the `install.sh` file. (Tip: `./install.sh`)
6. Wait for the installation to complete.
7. Upon completion, please ensure the environment variables are globalised for your terminal. The environment key-value pair will be shown on your Terminal. (Tip: `source ~/.bashrc`)
8. Please re-link the `libclntsh.dylib` file to the `libclntsh.dylib.19.1` file.
   - Delete the contents in the `lib` folder
      - `rm -rf ~/oracle/lib/*`
   - Re-link the `libclntsh.dylib` file to the `libclntsh.dylib.19.1` file
      - `ln -s ~/oracle/lib/libclntsh.dylib.19.1 ~/oracle/lib/libclntsh.dylib`
9. Woila! You can now run CX Oracle on any of your projects. Remember that the steps performed by you above is one-time only! If your installation is corrupted, please re-run the `install.sh` file.

## Steps (Apple Silicone - ARM64)

1. Install Docker on your machine
   - You may need to also install Docker Compose. Some distro doesn't have Docker Compose pre-installed.
2. Clone this repository
3. Open your terminal and navigate to the cloned repository (Tip: `cd`).
4. Install Rosetta
   - Why? Rosetta is a software that allows you to run Intel-based applications on Apple Silicon. In this case, CX Oracle Instantclient does not natively support ARM.
   - How? You can install Rosetta by running the following command in your terminal: `softwareupdate --install-rosetta`
5. Change the file permission of `install.sh` to executable. (Tip: `chmod +x install.sh`)
6. Run the `install.sh` file. (Tip: `./install.sh`)
7. Wait for the installation to complete.
8. Upon completion, please ensure the environment variables are globalised for your terminal. The environment key-value pair will be shown on your Terminal. (Tip: `source ~/.bashrc`)
9. Please re-link the `libclntsh.dylib` file to the `libclntsh.dylib.19.1` file.
   - Delete the contents in the `lib` folder
      - `rm -rf ~/oracle/lib/*`
   - Re-link the `libclntsh.dylib` file to the `libclntsh.dylib.19.1` file
      - `ln -s ~/oracle/lib/libclntsh.dylib.19.1 ~/oracle/lib/libclntsh.dylib`
10. Woila! You can now run CX Oracle on any of your projects. Remember that the steps performed by you above is one-time only! If your installation is corrupted, please re-run the `install.sh` file.

## Notes

- You may be asked for your password during the installation process. This is because the script needs to run some commands as `root` user, but it is totally safe!
- I will ensure the environment variables are globalised in the future! (WIP)

## Troubleshooting

- If you are facing any issues, please feel free to open an issue on this repository.
- Cannot locate a 64-bit Oracle Client Library
   ```
      cx_Oracle.DatabaseError: DPI-1047: Cannot locate a 64-bit Oracle Client library: "dlopen(/Users/raeveen/oracle/lib/libclntsh.dylib, 0x0001): tried: '/Users/raeveen/oracle/lib/libclntsh.dylib' (mach-o file, but is an incompatible architecture (have 'x86_64', need 'arm64')), '/System/Volumes/Preboot/Cryptexes/OS/Users/raeveen/oracle/lib/libclntsh.dylib' (no such file), '/Users/raeveen/oracle/lib/libclntsh.dylib' (mach-o file, but is an incompatible architecture (have 'x86_64', need 'arm64')), '/Users/raeveen/oracle/libclntsh.dylib.19.1' (mach-o file, but is an incompatible architecture (have 'x86_64', need 'arm64')), '/System/Volumes/Preboot/Cryptexes/OS/Users/raeveen/oracle/libclntsh.dylib.19.1' (no such file), '/Users/raeveen/oracle/libclntsh.dylib.19.1' (mach-o file, but is an incompatible architecture (have 'x86_64', need 'arm64'))". See https://cx-oracle.readthedocs.io/en/latest/user_guide/installation.html for help
   ```

   - In this case, ensure your commands are piped through Rosetta. For example, `arch -x86_64 flask run`.
      - Please note that by tweaking your bash profile, you can ensure all commands are piped through Rosetta - In this case, you don't need `arch -x86_64` anymore.

## Contributing

If you have any suggestions, please feel free to open an issue or a pull request.

## Contributors

- [InspectorGadget](https://github.com/InspectorGadget)
