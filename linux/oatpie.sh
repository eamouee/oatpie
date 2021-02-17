# Original files:
# 1. /usr/share/X11/xkb/symbols/us
# 2. /usr/share/X11/xkb/rules/base.xml
# 3. /usr/share/X11/xkb/rules/base.lst
# 4. /usr/share/X11/xkb/rules/evdev.xml
# 5. /usr/share/X11/xkb/rules/evdev.lst

cd /usr/share/X11/xkb

# Copy original files as *.old(.*)
sudo cp ./symbols/us ./symbols/us.old
sudo cp ./rules/base.xml ./rules/base.old.xml
sudo cp ./rules/base.lst ./rules/base.old.lst
sudo cp ./rules/evdev.xml ./rules/evdev.old.xml
sudo cp ./rules/evdev.lst ./rules/evdev.old.lst



# New layout text (Oatpie):
read -r -d '' text << EOM

//Author: Ehsan Amouee <eamouee@github>
partial alphanumeric_keys
xkb_symbols "oatpie" {

    name[Group1]= "English (Oatpie)";

    key <TLDE> { [  grave,asciitilde	]	};

    key <AE01> { [	1,	exclam		]	};
    key <AE02> { [	2,	at		]	};
    key <AE03> { [	3,	numbersign	]	};
    key <AE04> { [	4,	dollar		]	};
    key <AE05> { [	5,	percent		]	};
    key <AE06> { [	6,	asciicircum	]	};
    key <AE07> { [	7,	ampersand	]	};
    key <AE08> { [	8,	asterisk	]	};
    key <AE09> { [	9,	parenleft	]	};
    key <AE10> { [	0,	parenright	]	};
    key <AE11> { [	bracketleft,	braceleft	]	};
    key <AE12> { [	bracketright, braceright	]   	};

    key <AD01> { [	p,	P		]	};
    key <AD02> { [	y,	Y		]	};
    key <AD03> { [	g,	G		]	};
    key <AD04> { [	c,	C		]	};
    key <AD05> { [	j,	J		]	};
    key <AD06> { [	q,	Q		]	};
    key <AD07> { [	u,	U		]	};
    key <AD08> { [	m,	M		]	};
    key <AD09> { [	w,	W		]	};
    key <AD10> { [	f,	F		]	};
    key <AD11> { [	slash,	question	]	};
    key <AD12> { [	equal,	plus		]	};

    key <AC01> { [	o,	O	]	};
    key <AC02> { [	a,	A	]	};
    key <AC03> { [	t,	T	]	};
    key <AC04> { [	e,	E	]	};
    key <AC05> { [	d,	D	]	};
    key <AC06> { [	h,	H	]	};
    key <AC07> { [	i,	I	]	};
    key <AC08> { [	n,	N	]	};
    key <AC09> { [	s,	S	]	};
    key <AC10> { [	r,	R	]	};
    key <AC11> { [	l,	L	]	};

    key <AB01> { [	apostrophe,	quotedbl		]	};
    key <AB02> { [  semicolon,	colon			]	};
    key <AB03> { [  comma,	less		]	};
    key <AB04> { [	period,	greater		]	};
    key <AB05> { [	minus,	underscore	]	};
    key <AB06> { [	z,	Z		]	};
    key <AB07> { [	b,	B		]	};
    key <AB08> { [	v,	V		]	};
    key <AB09> { [	k,	K		]	};
    key <AB10> { [	x,	X		]	};

    key <BKSL> { [	backslash,  bar		]   	};
};

// OATPIE LAYOUT OVERVIEW
//  ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ __________
// | \`  | 1  | 2  | 3  | 4  | 5  | 6  | 7  | 8  | 9  | 0  | [  | ]  | <--      |
// | ~  | !  | @  | #  | $  | %  | ^  | &  | *  | (  | )  | {  | }  |          |
// |===========================================================================|
// | |<-   | P  | Y  | G  | C  | J  | Q  | U  | M  | W  | F  | ?  | +  |       |
// |  ->|  | p  | y  | g  | c  | j  | q  | u  | m  | w  | f  | /  | =  |  <-'  |
// |=====================================================================¬     |
// |         | O  | A  | T  | E  | D  | H  | I  | N  | S  | R  | L  | |  |     |
// | CAPS    | o  | a  | t  | e  | d  | h  | i  | n  | s  | r  | l  | \  |     |
// |===========================================================================|
// | ^         | "  | :  | <  | >  | _  | Z  | B  | V  | K  | X  |     ^       |
// | |         | '  | ;  | ,  | .  | -  | z  | b  | v  | k  | x  |     |       |
// |===========================================================================|
// |      |      |      |                       |       |      |     |         |
// | Ctrl | Super| Alt  |         Space         | AltGr | Super|Menu | Ctrl    |
//  ¯¯¯¯¯¯ ¯¯¯¯¯¯ ¯¯¯¯¯¯ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ ¯¯¯¯¯¯¯ ¯¯¯¯¯¯ ¯¯¯¯¯ ¯¯¯¯¯¯¯¯¯

EOM

# Append layout text to "us" file:
echo -e "$text" | sudo tee -a ./symbols/us > /dev/null
echo "Layout text was writen."


read -r -d '' variant << EOM
       <variant>
          <configItem>
            <name>oatpie</name>
            <description>English (Oatpie)</description>
          </configItem>
        </variant>
EOM

# generating new base.xml
line=$(grep -n 'English (Colemak)' ./rules/base.xml | cut -d ":" -f 1)
head -n $(($line+2)) ./rules/base.xml > ./rules/new_file
echo "$variant" >> ./rules/new_file
tail -n +$(($line+3)) ./rules/base.xml >> ./rules/new_file
sudo rm ./rules/base.xml
mv ./rules/new_file ./rules/base.xml
sudo chown root ./rules/base.xml
echo "base.xml was writen."

# generating new base.lst
line=$(grep -n 'English (Colemak)' ./rules/base.lst | cut -d ":" -f 1)
head -n $(($line)) ./rules/base.lst > ./rules/new_file
echo "  oatpie          us: English (Oatpie)" >> ./rules/new_file
tail -n +$(($line+1)) ./rules/base.lst >> ./rules/new_file
sudo rm ./rules/base.lst
mv ./rules/new_file ./rules/base.lst
sudo chown root ./rules/base.lst
echo "base.lst was writen."

# generating new evdev.xml
line=$(grep -n 'English (Colemak)' ./rules/evdev.xml | cut -d ":" -f 1)
head -n $(($line+2)) ./rules/evdev.xml > ./rules/new_file
echo "$variant" >> ./rules/new_file
tail -n +$(($line+3)) ./rules/evdev.xml >> ./rules/new_file
sudo rm ./rules/evdev.xml
mv ./rules/new_file ./rules/evdev.xml
sudo chown root ./rules/evdev.xml
echo "evdev.xml was writen."

# generating new evdev.lst
line=$(grep -n 'English (Colemak)' ./rules/evdev.lst | cut -d ":" -f 1)
head -n $(($line)) ./rules/evdev.lst > ./rules/new_file
echo "  oatpie          us: English (Oatpie)" >> ./rules/new_file
tail -n +$(($line+1)) ./rules/evdev.lst >> ./rules/new_file
sudo rm ./rules/evdev.lst
mv ./rules/new_file ./rules/evdev.lst
sudo chown root ./rules/evdev.lst
echo "evdev.lst was writen."

echo "All is done, restart and have more fun..."





