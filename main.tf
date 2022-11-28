# resource "tls_private_key" "example1" {
#   algorithm = "RSA"
  
# }

# resource "tls_self_signed_cert" "example" {
#   key_algorithm   = "RSA"
#   private_key_pem = tls_private_key.example1.private_key_pem

#   subject {
#     common_name  = "example.com"
#     organization = "ACME Examples, Inc"
#   }

#   validity_period_hours = 12

#   allowed_uses = [
#     "key_encipherment",
#     "digital_signature",
#     "server_auth",
#   ]
# }

# resource "aws_acm_certificate" "cert" {
#   private_key      = tls_private_key.example1.private_key_pem
#   certificate_body = tls_self_signed_cert.example.cert_pem
# }


resource "aws_acm_certificate" "tch-cert" {
    private_key=file("keyfile-encrypted-pem.key")
    certificate_body = file("new.crt")
    certificate_chain=file("chain.cer")
      tags = {
         Name = "api.ppe.rst.jenga.int.refinitiv.com"
         application-asset-insight-id = 	"204837"
        environment-type = "PRE-PRODUCTION"
        financial-identifier = "450011192"
        resource-owner = "app-se-rc@refinitiv.com"
        application-name = "application-name"
        }
    } 


    