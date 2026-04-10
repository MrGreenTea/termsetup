function git-overview --description "Quick repo health overview from git history"
    # Bail if we're not in a git repo
    if not git rev-parse --is-inside-work-tree &>/dev/null
        echo "Not inside a git repo." >&2
        return 1
    end

    # ── 1. Churn hotspots ────────────────────────────────────────────────
    echo ""
    set_color --bold cyan
    echo "── Churn hotspots (most-changed files, last year) ──"
    set_color normal
    set_color --dim
    set_color normal
    echo ""
    git log --format=format: --name-only --since="1 year ago" \
        | sort | uniq -c | sort -nr | head -20
    echo ""

    # ── 2. Who built this ────────────────────────────────────────────────
    set_color --bold cyan
    echo "── Contributors (all time) ──"
    set_color normal
    set_color --dim
    set_color normal
    echo ""
    git shortlog -sn HEAD
    echo ""

    set_color --bold cyan
    echo "── Contributors (last 6 months) ──"
    set_color normal
    echo ""
    git shortlog -sn --since="6 months ago" HEAD
    echo ""

    # ── 3. Bug clusters ──────────────────────────────────────────────────
    set_color --bold cyan
    echo "── Bug clusters (files in fix/bug/broken commits) ──"
    set_color normal
    set_color --dim
    echo "Cross-reference with churn hotspots above"
    set_color normal
    echo ""
    git log -i -E --grep="fix|bug|broken" --name-only --format='' \
        | sort | uniq -c | sort -nr | head -20
    echo ""

    # ── 4. Project velocity ──────────────────────────────────────────────
    set_color --bold cyan
    echo "── Commit velocity (by month) ──"
    set_color normal
    set_color --dim
    set_color normal
    echo ""

    # Collect monthly commit counts
    set -l raw_data (git log --format='%ad' --date=format:'%Y-%m' | sort | uniq -c)
    set -l months
    set -l counts
    for line in $raw_data
        set -l parts (string match -r '(\d+)\s+(\S+)' -- $line)
        set -a counts $parts[2]
        set -a months $parts[3]
    end

    # Bail if nothing to graph
    if test (count $months) -eq 0
        echo "  (no commits found)"
        echo ""
    else

        # Find max for scaling
        set -l max 0
        for c in $counts
            if test $c -gt $max
                set max $c
            end
        end

        # Draw the graph
        set -l bar_width 30
        set -l bar_len 0
        for i in (seq (count $months))
            set c $counts[$i]
            set m $months[$i]
            if test $max -gt 0
                set bar_len (math "floor($c * $bar_width / $max)")
            else
                set bar_len 0
            end
            set bar (string repeat -n $bar_len '█')
            if test -z "$bar"
                set bar ""
            end
            set pad (string repeat -n (math $bar_width - $bar_len) '░')
            if test -z "$pad"
                set pad ""
            end
            echo "  $m  $bar$pad  $c"
        end
        echo ""
    end

    # ── 5. Firefighting ──────────────────────────────────────────────────
    set_color --bold cyan
    echo "── Firefighting (reverts/hotfixes, last year) ──"
    set_color normal
    set_color --dim
    set_color normal
    echo ""
    set -l firefighting (git log --oneline --since="1 year ago" | grep -iE 'revert|hotfix|emergency|rollback')
    if test -z "$firefighting"
        echo "(none found — good sign!)"
    else
        printf '%s\n' $firefighting
    end
    echo ""
end
