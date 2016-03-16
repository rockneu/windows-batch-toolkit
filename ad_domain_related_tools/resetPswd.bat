@echo off
set /p userAccount=Input domain account to reset password£º
set /p confirm=To reset password for %userAccount% (y/n)?
if %confirm% equ n (
				echo Reset operation is cancelled.
				pause
				exit
)
if %userAccount% neq '' (
				@echo non-empty userAccount
				net user %userAccount% 123456 /domain
) else (
				rem invalid user account
				 @echo empty userAccount
				@echo Invalid user account!
)

if %errorlevel% neq 0 (
				@echo Failed to reset password for %userAccount%
) else (
				@echo Password is reset to 123456
)


pause