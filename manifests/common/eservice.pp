package {"subversion":
	ensure => installed,
}

package {"git":
	ensure => installed,
}

package {"maven":
	ensure => installed,
}

package {"curl":
	ensure => installed,
}

augeas {'BUILD_NUMBER':
	changes => ['set BUILD_NUMBER LOCAL']
}

