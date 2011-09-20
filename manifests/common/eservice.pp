package {"subversion":
	ensure => installed,
}

package {"git":
	ensure => installed,
}

package {"maven":
	ensure => installed,
}

augeas {'BUILD_NUMBER':
	changes => ['set BUILD_NUMBER LOCAL']
}

