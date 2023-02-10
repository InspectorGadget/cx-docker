# CX Oracle Installer through Docker

---
## Save your time?

| Name              | Link                                                                          |
| ----------------- | ----------------------------------------------------------------------------- |
| For Intel         | [Click here](https://github.com/InspectorGadget/cx-docker)                    |
| For Apple Silicon | [Click here](https://github.com/InspectorGadget/cx-docker/tree/apple-silicon) |

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
      - `ln -s ~/oracle/libclntsh.dylib.19.1 ~/oracle/lib/libclntsh.dylib`
9. Woila! You can now run CX Oracle on any of your projects. Remember that the steps performed by you above is one-time only! If your installation is corrupted, please re-run the `install.sh` file.

## Notes

- You may be asked for your password during the installation process. This is because the script needs to run some commands as `root` user, but it is totally safe!
- I will ensure the environment variables are globalised in the future! (WIP)

## Contributing

If you have any suggestions, please feel free to open an issue or a pull request.

## Contributors

- [InspectorGadget](https://github.com/InspectorGadget)
