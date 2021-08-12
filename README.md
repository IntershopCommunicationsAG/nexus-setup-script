### Preconditions

* CentOS 7
* Installed JDK 1.8

### Install and configure automatically

* Install Nexus

> <code>./nexus_install.sh</code>

* Configure Nexus automatically

> <code>./nexus_configure.sh</code>

* Alternative: Create respositories in Nexus 3.+
> <code>./create_repositories.sh</code> (see TODO and adjust credentials)
    
### Finalize configuration manually

* Set the following access settings for the repositories <code>'ishreleases'</code>, <code>'gradle'</code> and <code>'distributions'</code>: 'Allow File Browsing' and 'Include in Search' to TRUE.  

* Create the Intershop proxy repository
 
    name: <code>Intershop</code>	
    
    id: <code>ishrepo</code>
    
    type: <code>Proxy</code>
    
    Remote Url: <code>https://repo.intershop.de/content/repositories/contract-id</code>
    
    Fill out the Authentication with your credentials.
    
    Switch to the tab Routing and make sure Discovery is unchecked.
        
* Create the JCenter proxy repository
 
    name: <code>JCenter</code>	
    
    id: <code>jcenter</code>
    
    type: <code>Proxy</code>
    
    Remote Url: <code>https://jcenter.bintray.com/</code>
    
* Assign the Intershop proxy repository additionally to the <code>'Components'</code> repository group (order: Intershop, Intershop Releases, Releases, Gradle)

* Assign the Intershop and JCenter proxy repositories additionally to the <code>'Maven all'</code> repository group (order: JCenter, Central, Intershop)
