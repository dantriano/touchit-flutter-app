class Data {
  Data();
  //images
  static const String loremTitle =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit";
  static const String lorem =
      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?";
  static const String imageDir = "assets/images";
  static const String defaultAvatarImage = "$imageDir/avatar.jpg";
  static const String defaultBadgeImage = "$imageDir/car.png";
  static const defaultCoverImage = {
    'horizonatl': "$imageDir/horizontal.jpg",
    'vertical': "$imageDir/vertical.jpg",
    'square': "$imageDir/square.jpg"
  };
  static const String horizontalWebImage =
      "https://www.cg.nl/wp-content/uploads/2018/06/tech-header-01.jpg";
  static const String squareWebImage =
      "http://jetprogramme.org/wp-content/uploads/2017/03/Square-Instagram-Logo.png";
  static const String avatarWebImage =
      "https://cdn2.iconfinder.com/data/icons/avatar-face/96/avatar11-512.png";
  final pill1 = {
    'id': '1',
    'title': 'Como hacer daasundausid ado asiduhas',
    'cover': '',
    'sections': [
      {'id': '1', 'title': 'Section 1', 'position': 0, 'status': 'visible'},
      {'id': '2', 'title': 'Section 2', 'position': 1, 'status': 'visible'}
    ],
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  ',
    'children': [
      {
        'id': '0',
        'type': 'h1',
        'section': '1',
        'body': {'text': 'Section'},
        'order': '1',
        'state': 'visible',
      },
      {
        'id': '1',
        'section': '1',
        'type': 'paragraph',
        'body': {'text': 'This is the text'},
        'state': 'visible'
      },
      {
        'id': '2',
        'section': '1',
        'type': 'image',
        'body': {'src': horizontalWebImage},
        'state': 'visible'
      },
      {
        'id': '2',
        'section': '1',
        'type': 'image',
        'body': {'src': horizontalWebImage},
        'state': 'visible'
      },
      {
        'id': '1',
        'section': '2',
        'type': 'image',
        'body': {'src': horizontalWebImage},
        'state': 'visible'
      },
      {
        'id': '2',
        'section': '2',
        'type': 'image',
        'body': {'src': horizontalWebImage},
        'state': 'visible'
      },
      {
        'id': '3',
        'type': 'h1',
        'section': '1',
        'body': {'text': 'Section'},
        'order': '1',
        'state': 'visible',
      },
      {
        'id': '4',
        'section': '1',
        'type': 'paragraph',
        'body': {
          'text':
              'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which lo'
        },
        'state': 'visible'
      },
      {
        'id': '5',
        'section': '2',
        'type': 'image',
        'body': {'src': horizontalWebImage},
        'state': 'visible'
      }
    ],
    'rating': {'like': 20, 'unlike': 40},
    'createdOn': '20120227T132700',
    //'createdOn': new DateTime.now(),
    'createdBy': {'name': 'name', 'nick': '@nick', 'avatar': avatarWebImage},
  };
  final pill2 = {
    'id': '2',
    'title': 'Como hacer daasundausid ado asiduhas',
    'cover': '',
    'sections': [],
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  ',
    'children': [
      {
        'id': '0',
        'type': 'h1',
        'body': {'text': 'Section'},
        'order': '1',
        'state': 'visible',
      },
      {
        'id': '1',
        'type': 'paragraph',
        'body': {'text': 'This is the text'},
        'state': 'visible'
      },
      {
        'id': '2',
        'type': 'image',
        'body': {'src': horizontalWebImage},
        'state': 'visible'
      },
      {
        'id': '3',
        'type': 'h1',
        'body': {'text': 'Section'},
        'order': '1',
        'state': 'visible',
      },
      {
        'id': '4',
        'type': 'paragraph',
        'body': {
          'text':
              'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which lo'
        },
        'state': 'visible'
      },
      {
        'id': '5',
        'type': 'image',
        'body': {'src': horizontalWebImage},
        'state': 'visible'
      }
    ],
    'rating': {'like': 20, 'unlike': 40},
    'createdOn': '20120227T132700',
    //'createdOn': new DateTime.now(),
    'createdBy': {'name': 'name', 'nick': '@nick', 'avatar': avatarWebImage},
  };
  List pillsList = [];
  final badges = [
    {
      'id': '1',
      'name': 'Science',
      'icon': '$imageDir/lab.png',
      'parent': '0',
    },
    {
      'id': '2',
      'name': 'Mechanics',
      'icon': '$imageDir/car.png',
      'parent': '0',
    }
  ];
  final pillsCats = [
    {
      'id': '1',
      'name': 'Science',
      'icon': 'assets/images/lab.png',
      'parent': '0',
    },
    {
      'id': '2',
      'name': 'Mechanics',
      'icon': 'assets/images/car.png',
      'parent': '0',
    },
    {
      'id': '3',
      'name': 'Food',
      'icon': 'assets/images/fruit.png',
      'parent': '0',
    },
    {
      'id': '4',
      'name': 'Art',
      'icon': 'assets/images/paint.png',
      'parent': '0',
    },
    {
      'id': '5',
      'name': 'Maths',
      'icon': 'assets/images/math.png',
      'parent': '1',
    },
    {
      'name': 'Electronics',
      'icon': 'assets/images/gadget.png',
    },
    {
      'name': 'Electronics',
      'icon': 'assets/images/gadget.png',
    },
    {
      'name': 'Electronics',
      'icon': 'assets/images/gadget.png',
    },
    {
      'name': 'Electronics',
      'icon': 'assets/images/gadget.png',
    },
    {
      'name': 'Electronics',
      'icon': 'assets/images/gadget.png',
    },
    {
      'name': 'Electronics',
      'icon': 'assets/images/gadget.png',
    }
  ];

  static const String quickFont = "Quicksand";
}
