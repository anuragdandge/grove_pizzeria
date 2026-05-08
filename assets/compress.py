import os
import subprocess

# Path to ffmpeg executable
FFMPEG_PATH = r"E:\ffmpeg\bin\ffmpeg.exe"
# Directory to save compressed images
OUTPUT_DIR = "compressed"

def main():
    # Create the output directory if it doesn't exist
    if not os.path.exists(OUTPUT_DIR):
        os.makedirs(OUTPUT_DIR)

    extensions = {".jpg", ".jpeg", ".png", ".webp"}

    for filename in os.listdir("."):
        ext = os.path.splitext(filename)[1].lower()
        
        if ext in extensions:
            input_path = filename
            output_path = os.path.join(OUTPUT_DIR, filename)
            
            print(f"Compressing {filename}...")
            
            # ffmpeg command to compress the image
            # -y: Overwrite output file if it exists
            # -q:v 5: Sets the compression quality (lower is better quality, 2-31 range for JPEG)
            cmd = [
                FFMPEG_PATH,
                "-i", input_path,
                "-y",
                "-q:v", "5", 
                output_path
            ]
            
            try:
                # Run the ffmpeg command, suppressing output for cleaner logs
                subprocess.run(cmd, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                print(f" -> Saved to {output_path}")
            except subprocess.CalledProcessError as e:
                print(f" -> Failed to compress {filename}: {e}")
            except FileNotFoundError:
                print(" -> Error: FFmpeg not found at the specified path.")
                break

if __name__ == "__main__":
    main()
