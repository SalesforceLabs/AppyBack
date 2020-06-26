# AppyBack

This is the GitHub repository for the Salesforce Labs app AppyBack.
If you want to install the managed package or find out more about it, check out the AppExchange listing: https://appexchange.salesforce.com/appxListingDetail?listingId=a0N3u00000MBpFaEAL .
If you want to contribute or see the code, read below.


## Development

To work on this project in a scratch org:

1. [Set up CumulusCI](https://cumulusci.readthedocs.io/en/latest/tutorial.html)
    - For more info about CumulusCI hit the trail: https://trailhead.salesforce.com/en/content/learn/trails/build-applications-with-cumulusci .
2. Run `cci flow run dev_org --org dev` to deploy this project in a scratch org.
    - If you want to deploy in a non-namepaced org (unmanaged code) you can use the feature/unmanagedcode branch (master has some hardcoded namespace references, to be fixed)
3. Run `cci org browser dev` to open the org in your browser.
