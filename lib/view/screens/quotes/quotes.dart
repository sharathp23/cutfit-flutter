import 'package:flutter/material.dart';

class QuotesScreen extends StatefulWidget {
  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  List<Map<String, dynamic>> _quotes = [
    {
      'text': 'Believe you can and you\'re halfway there',
      'author': 'Sharath',
      'likes': 0,
      'isLiked': false
    },
    {
      'text': 'Sweat is just fat crying',
      'author': 'Unknown',
      'likes': 0,
      'isLiked': false
    },
    {
      'text': 'The only way to do great work is to love what you do',
      'author': 'Chirag',
      'likes': 0,
      'isLiked': false
    },
    {
      'text': 'The body achieves what the mind believes',
      'author': 'Nishanth',
      'likes': 0,
      'isLiked': false
    },
    {
      'text':
          'The doctor of the future will give no medication, but will interest his patients in the care of the human frame, diet and in the cause and prevention of disease.',
      'author': 'Thomas Edison',
      'likes': 0,
      'isLiked': false
    },
    {
      'text':
          'Meditation is not a way of making your mind quiet. Its a way of entering into the quiet that\'s already there - buried under the 50,000 thoughts the average person thinks every day.',
      'author': 'Deepak Chopra',
      'likes': 0,
      'isLiked': false
    },
    {
      'text':
          'To keep the body in good health is a duty, otherwise we shall not be able to keep our mind strong and clear.',
      'author': 'Buddha',
      'likes': 0,
      'isLiked': false
    },
    {
      'text':
          'Fitness is not about being better than someone else. Its about being better than you used to be.',
      'author': 'Unknown',
      'likes': 0,
      'isLiked': false
    },
    {
      'text':
          'The best way to lose weight is to close your mouth - something very difficult for a politician. Or watch your food - just watch it, don\'t eat it.',
      'author': 'Edward Koch',
      'likes': 0,
      'isLiked': false
    },
    {
      'text': 'The only bad workout is the one that didn\'t happen',
      'author': 'Unknown',
      'likes': 0,
      'isLiked': false
    },
    {
      'text': 'If it doesn\'t challenge you, it doesn\'t change you',
      'author': 'Fred DeVito',
      'likes': 0,
      'isLiked': false
    },
    {
      'text':
          'Fitness is not about being better than someone else. It\'s about being better than you used to be',
      'author': 'Unknown',
      'likes': 0,
      'isLiked': false
    },
    {
      'text':
          'Success is not final, failure is not fatal: it is the courage to continue that counts.',
      'author': 'Winston Churchill',
      'likes': 0,
      'isLiked': false
    },
    {
      'text':
          'You can never get a cup of tea large enough or a book long enough to suit me.',
      'author': 'C.S. Lewis',
      'likes': 0,
      'isLiked': false
    },
    {
      'text':
          'The only way to do great work is to love what you do. If you haven\'t found it yet, keep looking. Don\'t settle. As with all matters of the heart, you\'ll know when you find it.',
      'author': 'Steve Jobs',
      'likes': 0,
      'isLiked': false
    },
    {
      'text': 'Be the change that you wish to see in the world.',
      'author': 'Mahatma Gandhi',
      'likes': 0,
      'isLiked': false
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Quotes'),
      ),
      body: ListView.builder(
        itemCount: _quotes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(16.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(_quotes[index]['text']),
                  subtitle: Text('- ${_quotes[index]['author']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          _quotes[index]['isLiked']
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: _quotes[index]['isLiked'] ? Colors.red : null,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_quotes[index]['isLiked']) {
                              _quotes[index]['likes']--;
                            } else {
                              _quotes[index]['likes']++;
                            }
                            _quotes[index]['isLiked'] =
                                !_quotes[index]['isLiked'];
                          });
                        },
                      ),
                      Text('${_quotes[index]['likes']}'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showQuoteDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showQuoteDialog(BuildContext context) {
    String quoteText = '';
    String authorName = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Quote'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Quote'),
                onChanged: (value) {
                  quoteText = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Author'),
                onChanged: (value) {
                  authorName = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('ADD'),
              onPressed: () {
                if (quoteText.isNotEmpty && authorName.isNotEmpty) {
                  setState(() {
                    _quotes.insert(0, {
                      'text': quoteText,
                      'author': authorName,
                      'likes': 0,
                      'isLiked': false,
                    });
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
