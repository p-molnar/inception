<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'inception' );

/** MySQL database username */
define( 'DB_USER', 'pmolnar' );

/** MySQL database password */
define( 'DB_PASSWORD', '123abc' );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define( 'WP_ALLOW_REPAIR', true );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '9&&p%niPJ/EP5SS;+r!{LPu7KRomn!~|[9|c!YXq0FUY+|1:5b)cxS:tP<8y0;RF');
	define('SECURE_AUTH_KEY',  'MbhS6Yw|i.H-O,]!um]KZ+K(=hhH^$.7|%]d.Gtb8yZl5-)SHT:6&9#:lht#Ji@!');
	define('LOGGED_IN_KEY',    '19Td!t7+lOabK34 -]V-L%!({}e_>|<g1d]1PXeBXuew%#@)&k=WA)odMXp?p?G-');
	define('NONCE_KEY',        'D^N@E18u]N5)gZ0w_0QyFuP9IGH`Qog`VlIZsv]<c2VwI[lZ1VRjGK!-E5|#GkM$');
	define('AUTH_SALT',        '`je?vL@x`|9FU_YJH+zlc<[~G4Q3EO: )*BZ|AFW<gLh8w9hYDVIWh$~m<R4NrX6');
	define('SECURE_AUTH_SALT', 'FM4:e8oV?<qSKIED#yb#frS4MKQx;B3hs}U`++Zc!c3$eIoT-fLR)-Gx#k*ZJ5%u');
	define('LOGGED_IN_SALT',   'psG@*+*NwW%+rr~13hl9W-[$c|lMnLx{% srz-A^0+3y%sM%{L? nf/_Xi8wOx}e');
	define('NONCE_SALT',       '.%7<37r&=M=5*beeM-<SPt+=4QE07P!?[+|r5d~`S;t^),Pqj/?||1-rPi{y~k,`');


define('WP_CACHE', true);

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>