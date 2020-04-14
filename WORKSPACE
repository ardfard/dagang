# Give your project a name. :)
workspace(name = "dagang")

# Load the repository rule to download an http archive.
load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive"
)

# Download rules_haskell and make it accessible as "@rules_haskell".
http_archive(
    name = "rules_haskell",
    strip_prefix = "rules_haskell-0.11",
    urls = ["https://github.com/tweag/rules_haskell/archive/v0.11.tar.gz"],
    sha256 = "40fd6de12324b515042634ba13b02fa19f5c6e274eae6350be2e4d1e023fcd90",
)

load(
    "@rules_haskell//haskell:repositories.bzl",
    "rules_haskell_dependencies",
    "rules_haskell_toolchains",
)

# Setup all Bazel dependencies required by rules_haskell.
rules_haskell_dependencies()

# Download a GHC binary distribution from haskell.org and register it as a toolchain.
rules_haskell_toolchains()
