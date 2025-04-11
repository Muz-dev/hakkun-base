include_directories(
    #${CMAKE_SOURCE_DIR}/sys/hakkun/include/
    # You put your includes libraries here
)
set(LINKFLAGS -nodefaultlibs)
set(LLDFLAGS --no-demangle --gc-sections)

set(OPTIMIZE_OPTIONS_DEBUG -O2 -gdwarf-4)
set(OPTIMIZE_OPTIONS_RELEASE -O3 -ffast-math -flto)
set(WARN_OPTIONS -Werror=return-type -Wno-invalid-offsetof)
set(ASM_OPTIONS "")
set(C_OPTIONS -ffunction-sections -fdata-sections)
set(CXX_OPTIONS "")
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

set(IS_32_BIT FALSE) # Some older games are 32 bit
set(TARGET_IS_STATIC FALSE) # Do you want to statically link the symbols or dynamically link the symbols
set(MODULE_NAME Hakkun-base) # Change this to the name of your CMake Project
set(TITLE_ID ) # Set this to your title id
set(MODULE_BINARY subsdk9) # Best to keep this at 9 
set(SDK_PAST_1900 FALSE) # Most of the time this flag is false but if you have a very new game then it could be true
set(USE_SAIL TRUE) # We want to keep this true most of the time because sail allows our symbols to be properlly used

set(TRAMPOLINE_POOL_SIZE 0x10) # 0x10 is a good value for this but change this according to how many trampoline hooks you want.
set(BAKE_SYMBOLS FALSE) # Self explanitory

set(HAKKUN_ADDONS Nvn DebugRenderer) # These are the addons that you you are going to link
