# Autogenerated wrapper script for sinewave_jll for x86_64-unknown-freebsd11.1
export libsinewave

using FFTW_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libsinewave`
const libsinewave_splitpath = ["lib", "libsinewave.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libsinewave_path = ""

# libsinewave-specific global declaration
# This will be filled out by __init__()
libsinewave_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libsinewave = "libsinewave.so"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"sinewave")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (FFTW_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (FFTW_jll.LIBPATH_list,))

    global libsinewave_path = normpath(joinpath(artifact_dir, libsinewave_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libsinewave_handle = dlopen(libsinewave_path)
    push!(LIBPATH_list, dirname(libsinewave_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

