function project-roots -d "List project root directories under an optional directory" -a search_dir
    set -q search_dir[1]

    set -l exact_markers \
        package.json \
        pnpm-workspace.yaml \
        Cargo.toml \
        project.toml \
        pyproject.toml \
        go.mod \
        pom.xml \
        build.gradle \
        build.gradle.kts \
        composer.json \
        mix.exs \
        Package.swift \
        pubspec.yaml \
        flake.nix \
        justfile \
        Justfile
    set -l glob_markers '*.csproj' '*.sln'
    set -l roots
    set -l marker_glob (string join ',' $exact_markers $glob_markers)

    set -a roots (fd $fd_excludes --type f --glob "{$marker_glob}" $search_dir | path dirname)

    set -a roots (fd $fd_excludes --hidden --type d --glob '.git' $search_dir | path dirname)

    if test (count $roots) -eq 0
        return 0
    end

    printf '%s\n' $roots | sort -u
end
