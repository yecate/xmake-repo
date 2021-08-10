package("opencl-headers")

    set_kind("library", {headeronly = true})
    set_homepage("https://github.com/KhronosGroup/OpenCL-Headers/")
    set_description("Khronos OpenCL-Headers")
    set_license("Apache-2.0")

    add_urls("https://github.com/KhronosGroup/OpenCL-Headers/archive/refs/tags/$(version).tar.gz",
             "https://github.com/KhronosGroup/OpenCL-Headers.git")
    add_versions("v2021.06.30", "6640d590c30d90f89351f5e3043ae6363feeb19ac5e64bc35f8cfa1a6cd5498e")

    add_deps("cmake")
    on_install(function (package)
        import("package.tools.cmake").install(package, {"-DBUILD_TESTING=OFF"})
    end)

    on_test(function (package)
        assert(package:has_ctypes("cl_int", {includes = "CL/cl.h"}))
    end)