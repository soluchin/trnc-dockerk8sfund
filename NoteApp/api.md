### createNote Function: Creates a new note.

Parameters: req (request object), res (response object).
Extracts description from the request body.
Executes an SQL INSERT query via pool.query to add a note, responding with the new data.

### getAllNotes Function: Retrieves all notes.

Parameters: req, res.
Executes an SQL SELECT query via pool.query to fetch all records, responding with an array of notes.

### getOneNote Function: Retrieves a single note by note_id.

Parameters: req, res.
Uses the note_id from request parameters.
Executes an SQL SELECT query via pool.query with a WHERE clause, responding with the requested note.

### updateOneNote Function: Updates an existing note.

Parameters: req, res.
Extracts note_id and description from request parameters and body.
Executes an SQL UPDATE query via pool.query to modify the note description, responding with an update message.

### deleteOneNote Function: Deletes a note.

Parameters: req, res.
Extracts note_id from request parameters.
Executes an SQL DELETE query via pool.query to remove a note, responding with a deletion message.