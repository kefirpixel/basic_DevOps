#!/bin/bash

TELEGRAM_BOT_TOKEN="6645487497:AAERRoVIOUfD6ZxKVBcUWWzrfLnGOxcThuI"
TELEGRAM_USER_ID="814261102"
TIME='10 seconds'
URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
if [[ $CI_JOB_STATUS = "success" ]]; then
    STATUS=✅
else
    STATUS=❌
fi
TEXT="Stage '$1'%0AStatus: $STATUS%0A%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"

curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null