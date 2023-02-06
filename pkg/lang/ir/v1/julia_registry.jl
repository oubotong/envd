# Create an empty (bare) git repository to host the registry
run(`git init --bare local-registry.git`)

# Populate the repository with a new, empty local registry
using LocalRegistry
Base.Filesystem.mktempdir() do dir
    create_registry(joinpath(dir, "local-registry"),
                    abspath("local-registry.git"),
                    description = "(unused) local registry",
                    push=true)
end