import subprocess
import sys

def install_s_tui():
    try:
        # Create a virtual environment
        subprocess.check_call([sys.executable, '-m', 'venv', 's_tui_env'])

        # Install s-tui in the virtual environment
        subprocess.check_call(['s_tui_env/bin/pip', 'install', 's-tui'])

        print("s-tui installed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to install s-tui: {e}")

def run_s_tui():
    subprocess.run(['sudo', 's-tui', '-h'], check=True)
    try:
            # Run s-tui from the virtual environment
            stui1 = input("Enter the command:")
            stuil = stui1.split()
            subprocess.run(stuil, check=True)

    except FileNotFoundError:
            print("s-tui is not installed or not found in the virtual environment.")

if __name__ == "__main__":
    install_s_tui()
    run_s_tui()
