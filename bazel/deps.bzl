"""Dependency specific initialization."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

def deps(repo_mapping = {}):
    rules_foreign_cc_dependencies()

    if "com_github_curl_curl" not in native.existing_rules():
        http_archive(
            name = "com_github_curl_curl",
            url = "https://github.com/curl/curl/archive/refs/tags/curl-7_78_0.tar.gz",
            sha256 = "ffa8f79f68dd77b08987ce16acd1f292875df8ab3bf7e3654f98d62b445ebd9a",
            strip_prefix = "curl-curl-7_78_0",
            repo_mapping = repo_mapping,
            build_file = "@com_github_4rdparty_bazel_rules_libcurl//:BUILD.bazel",
        )
