*** Settings *** 

Library          AppiumLibrary

*** Variables ***

${CURDIR}                    
${NO-RESET}                  true
${REMOTE_URL}                http://localhost:4723/wd/hub
${PLATFORM_NAME}             Android
${PLATFORM_VERSION}          13
${DEVICE_NAME}               Pixel4
${APP_PACKAGE}               com.mobapps.ganhardinheiro
${APP_ACTIVITY}              .presentation.start.StartActivity
${AUTOMATION_NAME}           appium
${APK_PATH_HML}              ${CURDIR}/app/ganhar.apk