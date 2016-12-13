#!/usr/bin/python3

import http.server
import ssl

httpd = http.server.HTTPServer(('0.0.0.0', 443), http.server.SimpleHTTPRequestHandler)

server_ctx = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
#server_ctx.set_ecdh_curve('prime256v1')
#server_ctx.set_ciphers('ECDHE-RSA-AES128-GCM-SHA256')
server_ctx.load_cert_chain('/home/ubuntu/ca-bundle_domain.pem', '/home/ubuntu/domain_com.key')

httpd.socket = server_ctx.wrap_socket(httpd.socket, server_side=True)
httpd.serve_forever()
