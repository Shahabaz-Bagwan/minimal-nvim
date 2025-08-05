return {
  settings = {
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--suggest-missing-includes",
      "--completion-style=bundled",
      "--cross-file-rename",
      "--header-insertion=iwyu",
    },
    root_dir = {
      root_pattern = {
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        "configure.ac",
        ".git",
      },
    },

    filetypes = {
      "c",
      "cpp",
      "objc",
      "objcpp",
      "cuda",
      "proto",
    },
    single_file_support = true,
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
    },
    flags = { debounce_text_changes = 150 },
  },
}
