# Bazel build rules for [libcurl](https://github.com/curl/curl)

Follows a "repos/deps" pattern (in order to help with recursive dependencies). To use:

1. Copy `bazel/repos.bzl` into your repository at `3rdparty/bazel-rules-libcurl/repos.bzl` as well.

2. Copy all of the directories from `3rdparty` that you ***don't*** already have in ***your*** repository's `3rdparty` directory.

3. Either ... add the following to your `WORKSPACE` (or `WORKSPACE.bazel`):

```bazel
load("//3rdparty/bazel-rules-libcurl:repos.bzl", libcurl_repos="repos")
libcurl_repos()

load("@com_github_3rdparty_bazel_rules_liblibcurl//bazel:deps.bzl", libcurl_deps="deps")
libcurl_deps()
```

Or ... to simplify others depending on ***your*** repository, add the following to your `repos.bzl`:

```bazel
load("//3rdparty/bazel-rules-libcurl:repos.bzl", libcurl_repos="repos")

def repos():
    libcurl_repos()
```

And the following to your `deps.bzl`:

```bazel
load("@com_github_3rdparty_bazel_rules_libcurl//bazel:deps.bzl", libcurl_deps="deps")

def deps():
    libcurl_deps()
```

4. You can then use `@com_github_libcurl_libcurl//:libcurl` in your target's `deps`.

5. Repeat the steps starting at (1) at the desired version of this repository that you want to use:

| libcurl | Copy `bazel/repos.bzl` from: |
| :---: | :--------------------------: |
| 1.42.0 | [16758d8](https://github.com/3rdparty/bazel-rules-libcurl/tree/16758d840b7abf529943e78bc7afa2a7e5381dc0) |
