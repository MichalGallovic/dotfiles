# Global instructions

## Shell

- The Bash tool runs zsh, which doesn't word-split unquoted variables. Never put several flags in one variable (`P="--profile x --region y"; aws ... $P`): zsh passes it as a single argument. Write the flags out, use an array (`args=(--profile x); aws ... "${args[@]}"`), or use env vars (`AWS_PROFILE=production AWS_REGION=us-east-1`).
- Same for `--include=*.php` style globs: zsh fails with "no matches found" before the command runs. Quote them (`--include='*.php'`).
- Brace variables followed by a colon: `$A:role/x` makes zsh apply the `:r` modifier (also `:s`, `:t`, `:h`, `:e`…) and mangles ARNs. Write `${A}:role/x`.
- When a later command consumes an earlier command's output file (e.g. `gh pr edit --body-file`), chain them with `&&` and check the file is non-empty, so a failed step can't publish an empty file.

## Tests

- To run the whole test suite, use `wilson phpunit` (from the project root, where `wilson.json` lives) instead of running PHPUnit locally. Run single tests or files locally as usual. To dig into a failed test, use `wilson debug <test id>`.
