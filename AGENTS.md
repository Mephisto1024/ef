# Project Instructions

- When the user asks to "提交", "提交这个文件", or otherwise requests a commit, treat it as the full GitHub flow by default: stage the requested changes, create a local commit, and push the commit to the configured GitHub remote.
- If the user explicitly says "只本地提交" or otherwise asks not to push, create only the local commit.
- Keep unrelated working tree changes out of the commit unless the user explicitly asks to include them.
