function fish_prompt
  if git rev-parse --git-dir > /dev/null 2>&1
    set branch (git branch --show-current)
    set branch \($branch\)
  end

  printf "λ %s %s " (prompt_pwd) $branch
end

# vim: set shiftwidth=2
