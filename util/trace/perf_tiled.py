# Compare performance of tiled vs untiled layers on snitch/snax
import subprocess
"""
Does the following:
0. make -C target... clean-data
1. make -C target... all LENGTH=... TILE_SIZE=...
2. run bin/snitch_cluster.vlt something.elf
3. make traces
4. copy over logs and rename
"""
def generate_data_points():
    return [(20, 4), (32, 4), (512, 32)]

def compile_example(sizes, target_directory):
    """
    Build a tiled/untiled example with:
    * sizes = (length, tile_size)
    * target_directory = directory from which to invoke make
    """
    # Clean up the previous result, if any:
    subprocess.run(["make", "-C", target_directory, "clean-data"])
    # Run the compilation
    subprocess.run(["make", "-C", target_directory, "all", f"LENGTH={sizes[0]}",f"TILE_SIZE={sizes[1]}"])


def post_process_trace_example(log_directory):
    """
    Post process a ran example by looking at the logs
    * log_directory: directory that contains `logs/trace_*.dasm`
    """
    subprocess.run(["make","-j","traces"])

if __name__ == "__main__":
    data_points = generate_data_points()
    target_directory = "sw/apps/snax-mac-simple/tiled"
    log_directory = "."
    for i in data_points:
        compile_example(i, target_directory)
        try:
            subprocess.run(["bin/snitch_cluster.vlt", target_directory+"/build/tiled.elf"], check=True)
        except subprocess.CalledProcessError as e:
            # Skip post-processing if there was an error in running the example
            print(f"Failed for length={i[0]}, tile_size={i[1]}")
            continue
        post_process_trace_example(log_directory)
