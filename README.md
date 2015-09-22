### Preconditions

* CentOS 7

### Install and configure automatically

* Install Nexus

> <code>./nexus_install.sh</code>

* Configure Nexus automatically

> <code>./nexus_configure.sh</code>
    
### Finalize configuration manually

* Set the following access settings for the repositories <code>'ishreleases'</code>, <code>'gradle'</code> and <code>'distributions'</code>: 'Allow File Browsing' and 'Include in Search' to TRUE.  

* Create the Intershop proxy repository
 
    name: <code>Intershop</code>	
    
    id: <code>ishrepo</code>
    
    type: <code>Proxy</code>
    
    Remote Url: <code>https://repo.intershop.de/content/repositories/contract-id</code>
    
    If you need additional remote repositories, all these repositories should be configured in one group.
    
    This makes it easier to configure this kind of repositories in the Gradle configuration, because all different repositories are usable via one URL.
    
    These repositories provide third party artifacts from public Maven repositories. The repository server needs internet access.

* Assign this Intershop proxy repository additionally to the <code>'Components'</code> repository group.