# Kraken Engine - vcpkg Registry

This is the official [vcpkg](https://github.com/microsoft/vcpkg) custom registry for the **Kraken Engine**. 

By adding this registry to your project, you can easily install and link Kraken Engine (and all of its C++ dependencies) using standard package management.

## Quick Start

### 1. Configure the Registry
Create a file named `vcpkg-configuration.json` at the root of your project (next to your `vcpkg.json`). Copy and paste the following:

```json
{
  "default-registry": {
    "kind": "builtin"
  },
  "registries": [
    {
      "kind": "git",
      "repository": "https://github.com/Kraken-Engine/kraken-registry",
      "baseline": "INSERT_COMMIT_HASH_HERE",
      "packages": [ "kraken-engine" ]
    }
  ]
}
```
> Note: Replace INSERT_COMMIT_HASH_HERE with the latest commit hash from the main branch of this repository.

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
target_link_libraries(MyGame PRIVATE Kraken::Kraken)
```
