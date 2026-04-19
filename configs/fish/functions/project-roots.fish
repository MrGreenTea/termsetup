function project-roots --description "List project root directories under the current directory"
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

    for marker in $exact_markers
        set -a roots (fd $fd_excludes  --type f --glob "$marker" | path dirname)
    end

    for marker in $glob_markers
        set -a roots (fd $fd_excludes  --type f --glob "$marker" | path dirname)
    end

    set -a roots (fd $fd_excludes --hidden --type d --glob '.git' | path dirname)

    if test (count $roots) -eq 0
        return 0
    end

    printf '%s\n' $roots | sort -u
end
