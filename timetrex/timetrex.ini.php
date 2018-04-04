; <?php die('Unauthorized Access...'); //SECURITY MECHANISM, DO NOT REMOVE//?>
;
;
; TimeTrex Configuration File
; *Linux* Example
;
;
;
; System paths. NO TRAILING SLASHES!
;

[path]
; URL to TimeTrex web root directory. ie: http://your.domain.com/<*BASE_URL*>
; DO NOT INCLUDE http://your.domain.com, just the directory AFTER your domain
base_url = "/interface"
;
; Log directory  -- NOTICE: For security reasons, this should always be outside the web server document root.
;
log = "C:\TimeTrex\log"
;
; Full path and name to the PHP CLI Binary
;
php_cli = "C:\TimeTrex\php\php-win.exe"
;
; Misc storage, for attachments/images -- NOTICE: For security reasons, this should always be outside the web server document root.
;
storage = "C:\TimeTrex\storage"

;
; Database connection settings. These can be set from the installer.
;

[database]
database_name = timetrex
host = "localhost:5433"
password = 6d2bb03c2
type = postgres8
user = timetrex

;
; Email delivery settings.
;

[mail]
; Least setup, deliver email through TimeTrex's email relay via SOAP (HTTP port 80/443)
delivery_method = soap

; Deliver email through remote SMTP server with the following settings.
; delivery_method = smtp
; smtp_host=smtp.gmail.com
; smtp_port=587
; smtp_username=timetrex@gmail.com
; smtp_password=testpass123
; The domain that emails will be sent from, do not include the "@" or anything before it.
; *ONLY* specify this if "delivery_method" above is "smtp"
; email_domain = mydomain.com
; The local part of the email address that emails will be sent from, do not include the "@" or anything after it.
; *ONLY* specify this if "delivery_method" above is "smtp"
; email_local_part = DoNotReply
;
; Cache settings
;

[cache]
; NOTICE: For security reasons, this must be outside the web server document root.
dir = "C:\TimeTrex\cache"
enable = TRUE

[debug]
buffer_output = TRUE
enable = FALSE
enable_display = FALSE
enable_log = FALSE
; Set to false if you're debugging
production = TRUE
verbosity = 10

[other]
default_interface = html5
uuid_seed = e1d6a404182b
; Force all clients to use SSL.
force_ssl = FALSE
; Specify the URL hostname to be used to access TimeTrex. The BASE_URL specified above will be appended on to this automatically.
; This should be a fully qualified domain name only, do not include http:// or any trailing directories.
hostname = localhost
installer_enabled = FALSE
primary_company_id = 11e826af-b261-82c0-8d58-e1d6a404182b
; ONLY when using a fully qualified hostname specified above, enable CSRF validation for increased security.
; enable_csrf_validation = TRUE
; System Administrators Email address to send critical errors to if necessary. Set to FALSE to disable completely.
; system_admin_email = "sysadmin@mydomain.com"
; WARNING: DO NOT CHANGE THIS AFTER YOU HAVE INSTALLED TIMETREX.
; If you do it will cause all your passwords to become invalid,
; and you may lose access to some encrypted data.
salt = 659da27e09ed5b246dce5890ad372bd3

