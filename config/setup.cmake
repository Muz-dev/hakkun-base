if (NOT EXISTS ${CMAKE_SOURCE_DIR}/lib/std)
    execute_process(
        COMMAND python3 ${CMAKE_SOURCE_DIR}/sys/tools/setup_libcxx_prepackaged.py
    ) 
endif()    
if (NOT EXISTS ${CMAKE_SOURCE_DIR}/sys/hakkun/sail/build)
    execute_process(
        COMMAND python3 ${CMAKE_SOURCE_DIR}/sys/tools/setup_sail.py
    )
endif()    