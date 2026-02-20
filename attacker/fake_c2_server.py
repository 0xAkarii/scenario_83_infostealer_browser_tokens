from http.server import BaseHTTPRequestHandler, HTTPServer
import os

OUTPUT = "received_tokens.log"

class Handler(BaseHTTPRequestHandler):
    def do_POST(self):
        length = int(self.headers.get("Content-Length", 0))
        data = self.rfile.read(length)

        with open(OUTPUT, "ab") as f:
            f.write(data + b"\n")

        self.send_response(200)
        self.end_headers()

    def log_message(self, *args):
        return

HTTPServer(("0.0.0.0", 9137), Handler).serve_forever()
