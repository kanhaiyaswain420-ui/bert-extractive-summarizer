"""
Simple web server to serve the HTML file
Run this alongside the BERT server so friends can access it via browser
"""

from http.server import HTTPServer, SimpleHTTPRequestHandler
import socket
import webbrowser
import os

class CORSRequestHandler(SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        super().end_headers()

    def do_OPTIONS(self):
        self.send_response(200)
        self.end_headers()

def get_local_ip():
    """Get the local IP address"""
    try:
        # Connect to a remote address to determine local IP
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        ip = s.getsockname()[0]
        s.close()
        return ip
    except:
        return "127.0.0.1"

def main():
    port = 8000
    local_ip = get_local_ip()
    
    # Change to the directory containing this script
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    
    server_address = ('', port)
    httpd = HTTPServer(server_address, CORSRequestHandler)
    
    print("=" * 60)
    print("Web Server Started!")
    print("=" * 60)
    print(f"\nLocal access:")
    print(f"  http://localhost:{port}/summarizer.html")
    print(f"\nNetwork access (share with friends):")
    print(f"  http://{local_ip}:{port}/summarizer.html")
    print("\n" + "=" * 60)
    print("IMPORTANT: Make sure the BERT server is also running!")
    print("  Run: .\\start_server.bat")
    print("=" * 60)
    print("\nPress Ctrl+C to stop the server\n")
    
    # Try to open browser automatically
    try:
        webbrowser.open(f'http://localhost:{port}/summarizer.html')
    except:
        pass
    
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n\nServer stopped.")
        httpd.server_close()

if __name__ == '__main__':
    main()


