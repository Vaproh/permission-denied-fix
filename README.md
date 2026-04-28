# Permission Denied – Debug & Fix

## Problem
The application failed to run due to a **Permission Denied (Errno 13)** error.

This typically occurs when the service user does not have access to required files or directories.

---

## Investigation

Steps taken to debug the issue:

- Checked ownership of application directory  
- Verified which user the service was running as  
- Inspected file permissions  

### Commands used:
```bash
ls -l /var/www/
ps aux | grep nginx
````

---

## Root Cause

The application directory was owned by `root`, while the service was running as `www-data`.

This mismatch prevented the service from accessing necessary files.

---

## Fix

Updated ownership and permissions:

```bash
sudo chown -R www-data:www-data /var/www/app
sudo chmod -R 755 /var/www/app
```

Restarted the service after applying changes.

---

## Result

* Application started successfully
* Permission errors resolved
* Stable access for service user restored

---

## Key Takeaways

* Always match file ownership with the service user
* Incorrect permissions can break deployments even if configs are correct
* Use `ls -l` to quickly diagnose permission issues
* Avoid running services as root unless absolutely necessary

---

## Notes

This is a common issue in production environments where:

* files are uploaded or deployed as root
* services run under restricted users
* permissions are not properly configured

Understanding ownership and access control is critical for server stability.
