;; set news group
(setq gnus-select-method '(nntp "news.gmane.org"))

(setq user-full-name "Jarvis") 
(setq user-mail-address "bhdaoka@qq.com")


;; set email reader 
(setq gnus-secondary-select-methods '((nnml ""))) 

 ;; set pop server 
(setq mail-sources 
      '((pop :server "pop.qq.com"   ;; 在这里设置 pop3 服务器
             :user "bhdaoka@qq.com"     ;; 用户名
             :port "pop3"
             :password "xxxxxx")))        ;; 密码

;; set smtp 
(setq smtpmail-auth-credentials 
    '(("smpt.qq.com"                ;; SMTP 服务器
       25                                   ;; 端口号
       "bhdaoka@qq.com"                 ;; 用户名
       "xxxxxx")))                    ;; 密码

(setq smtpmail-default-smtp-server "smtp.qq.com") 
(setq smtpmail-smtp-server "smtp.qq.com") 
(setq message-send-mail-function 'smtpmail-send-it) 
