### SDSC Summer Institute 2023 
# Session 1.0 Preparation Day


**Date: Wednesday, August 2nd, 2023**


## Welcome & Orientation
[Robert Sinkovits, Director of Education and Training](https://www.sdsc.edu/research/researcher_spotlight/sinkovits_robert.html)


## Accounts, Login, Environment, Running Jobs and Logging into Expanse User Portal
Marty Kandes, Computational & Data Science Research Specialist, HPC User Services Group

In this virtual session, we'll familiarize you with logging into Expanse with your training account both via the Expane User Portal and directly via SSH. We'll also have you run and test some of the command aliases we've setup in your enviornment on Expanse to make your hands-on work next week at the Summer Institute easier to manage and get started working on the system. 

### Getting your training account and password

You should have received an email with the subject line: **HPC & DS 2023 Summer Institute: Account Set-Up**. The content of the email should be as follows:

```
Your personalized account information is given below.

Your password is made available through a one-time URL. Be sure to securely record your password immediately since you will not be able to access the URL a third time.

The one-time URL will expire after 14 days, or after 2 viewings, whichever comes first.


    Username: trainXXX (or etrainXXX)
    URL to retrieve password: https://pwpush.security.sdsc.edu/XXXXXXXXXXXXXXXXXXXXXXXXXXXXX


As a reminder, we are asking all attendees to use the training accounts that we are providing, even if you already have your own account. This will minimize problems related to custom configurations (e.g. environment variables, choice of shell, etc.) that may cause some of the hands-on examples to break.

This training account may be used:
  * Via SSH directly to login.expanse.sdsc.edu
  * Via a special page on the Expanse Portal: https://portal.expanse.sdsc.edu/training

For any account user issues/questions, contact consult@sdsc.edu. 
```

If you are no longer able to retrieve your password and/or have forgotten the password, please let us know in the Zoom chat. We will resend you a new password as soon as possible.

### Login to the Expanse User Portal

Once you have your training account username and password, please open your favorite web broswer to the [Expanse User Portal](https://portal.expanse.sdsc.edu/training) and attempt to login. If you are unable to login to the portal, please let us know in the Zoom chat. We may need to help you debug the problem. Please note, however, restarting your web browser in private mode is typically the first quick fix  we'll try.

If you're able to login successfully, please feel free to explore what's available via portal. You can find the portal's **Online Documentation** under the **Help** tab in the upper right of the dashboard. We'll do a quick tour of the portal as well once we get everyone logged in. 

### Login to Expanse via SSH.

After you're done exploring the Expanse User Portal, please also attempt to login directly to Expanse via SSH. 
```
ssh trainXXX@login.expanse.sdsc.edu
```
You should be prompted for the same password you used to login to the portal. 

It's possible that we may experience an outage of the portal during the Summer Institute, so it's good to also make sure you have direct access via SSH. Or maybe you, like me, prefer to work from a standard terminal application. 



Additional Notes:
- https://github.com/sdsc/sdsc-summer-institute-2022/tree/main/1.0_preparation_day_welcome_and_orientation
- https://education.sdsc.edu/training/interactive/202208_sdscsi/section1_1/
- https://education.sdsc.edu/training/interactive/202208_sdscsi/section1_2/
