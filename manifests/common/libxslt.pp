class libxslt{
package {'libxslt':
		ensure => installed,
	}
package {'libxslt-devel':
		ensure => installed,
	}
}
