# Kraken Engine - vcpkg Registry

This is the official [vcpkg](https://github.com/microsoft/vcpkg) custom registry for the **Kraken Engine**. 

By adding this registry to your project, you can easily install and link Kraken Engine (and all of its C++ dependencies) using standard package management.

## Quick Start

### 1. Configure the Registry
Create a file named `vcpkg-configuration.json` at the root of your project (next to your `vcpkg.json`). Copy and paste the following:

```json
{
  "default-registry": {
    "kind": "builtin",
    "baseline": "0b88aacde46a853151730fbe7d0b7ee45f4b6864" 
  },
  "registries": [
    {
      "kind": "git",
      "repository": "https://github.com/Kraken-Engine/vcpkg-registry",
      "baseline": "INSERT_COMMIT_HASH_HERE",
      "packages": [ "kraken-engine" ]
    }
  ]
}
```
> Note: Replace `INSERT_COMMIT_HASH_HERE` with the latest commit hash from the main branch of this repository.
> The default-registry baseline ensures all standard C++ dependencies (like SDL3) are locked to a specific version. You can update this hash to match your local vcpkg installation.
> Already have a configuration file? If your project already uses a vcpkg-configuration.json (for artifacts or other registries), simply add the Kraken-Engine object to your existing "registries" array.

### 2. Add the Dependency
Add kraken-engine to your project's vcpkg.json manifest file:
```json
{
  "dependencies": [
    "kraken-engine"
  ]
}
```

### 3. Install and Link
Run your standard install command:
```shell
vcpkg install
```

Then, link the engine in your CMakeLists.txt:
```cmake
find_package(KrakenEngine CONFIG REQUIRED)

add_executable(MyGame main.cpp)
target_link_libraries(MyGame PRIVATE Kraken::KrakenEngine)
```
