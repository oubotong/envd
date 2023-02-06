using LocalPackageServer

config = LocalPackageServer.Config(Dict(
    "host"           => "127.0.0.1",
    "port"           => 9999,
    "pkg_server"     => "https://pkg.julialang.org",

    # This is where cache will be stored
    "local_registry" => abspath("local-registry.git"), 
    "cache_dir"      => abspath("cache"),
    "git_clones_dir" => abspath("data"),
))

if get(ENV, "LOCAL_PKG_SERVER_OFFLINE", "0") == "1"
    @info "Running offline => no registry updates"
    config.min_time_between_registry_updates = typemax(Int)
end

LocalPackageServer.start(config)
