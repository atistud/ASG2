// $Id: file_sys.h,v 1.6 2018-06-27 14:44:57-07 - - $

#ifndef __INODE_H__
#define __INODE_H__

#include <exception>
#include <iostream>
#include <memory>
#include <map>
#include <vector>
using namespace std;

#include "util.h"

// inode_t -
//    An inode is either a directory or a plain file.

enum class file_type { PLAIN_TYPE, DIRECTORY_TYPE };
class inode;
class base_file;
class plain_file;
class directory;
using inode_ptr = shared_ptr<inode>;
using base_file_ptr = shared_ptr<base_file>;
ostream& operator<< (ostream&, file_type);


// inode_state -
//    A small convenient class to maintain the state of the simulated
//    process:  the root (/), the current directory (.), and the
//    prompt.

class inode_state {
     friend class inode;
     friend ostream& operator<< (ostream& out, const inode_state&);
private:
     inode_ptr root{ nullptr };
     inode_ptr cwd{ nullptr };
     string prompt_{ "% " };
public:
     inode_state(const inode_state&) = delete; // copy ctor
     inode_state& operator= (const inode_state&) = delete; // op=
     inode_state();
     const string& prompt() const;
     void setPrompt(const wordvec& newPrompt);
     bool setCwd(const string& dir);
     void setCwd(const inode_ptr& dir);
     inode_ptr getcwd();
     void rootDir(inode_ptr ptr);
};

// class inode -
// inode ctor -
//    Create a new inode of the given type.
// get_inode_nr -
//    Retrieves the serial number of the inode.  Inode numbers are
//    allocated in sequence by small integer.
// size -
//    Returns the size of an inode.  For a directory, this is the
//    number of dirents.  For a text file, the number of characters
//    when printed (the sum of the lengths of each word, plus the
//    number of words.
//    

class inode {
     friend class inode_state;
private:
     static size_t next_inode_nr;
     size_t inode_nr;
     base_file_ptr contents;
public:
     inode(file_type);
     size_t get_inode_nr() const;
     base_file_ptr getContents();
     //inode copyContents (const inode& that);
     //inode& operator= (const inode& that);
     //inode_ptr operator= (const inode& that);
     //base_file_ptr& operator= (const directory* that)
};


// class base_file -
// Just a base class at which an inode can point.  No data or
// functions.  Makes the synthesized members useable only from
// the derived classes.

class file_error : public runtime_error {
public:
     explicit file_error(const string& what);
};

class base_file {
protected:
     base_file() = default;
private:
     virtual void init_dir(inode_ptr current, inode_ptr parent) = 0;
public:
     virtual ~base_file() = default;
     base_file(const base_file&) = delete;
     base_file& operator= (const base_file& that);
     virtual size_t size() const = 0;
     virtual const wordvec& readfile() const = 0;
     virtual void writefile(const wordvec& newdata) = 0;
     virtual void remove(const string& filename) = 0;
     virtual inode_ptr mkdir(const string& dirname) = 0;
     virtual inode_ptr mkfile(const string& filename) = 0;
     virtual map<string, inode_ptr> getDirents() = 0;
     virtual void setDirents(map<string, inode_ptr> newDirents) = 0;

};

// class plain_file -
// Used to hold data.
// synthesized default ctor -
//    Default vector<string> is a an empty vector.
// readfile -
//    Returns a copy of the contents of the wordvec in the file.
// writefile -
//    Replaces the contents of a file with new contents.

class plain_file : public base_file {
private:
     wordvec data;
     virtual void init_dir(inode_ptr current, inode_ptr parent) override;
     virtual void setDirents(map<string, inode_ptr> newDirents) override;
public:
     //~plain_file();
     plain_file(wordvec d);
     plain_file();
     virtual size_t size() const override;
     virtual const wordvec& readfile() const override;
     virtual void writefile(const wordvec& newdata) override;
     virtual void remove(const string& filename) override;
     virtual inode_ptr mkdir(const string& dirname) override;
     virtual inode_ptr mkfile(const string& filename) override;
     virtual map<string, inode_ptr> getDirents() override;
};

// class directory -
// Used to map filenames onto inode pointers.
// default ctor -
//    Creates a new map with keys "." and "..".
// remove -
//    Removes the file or subdirectory from the current inode.
//    Throws an file_error if this is not a directory, the file
//    does not exist, or the subdirectory is not empty.
//    Here empty means the only entries are dot (.) and dotdot (..).
// mkdir -
//    Creates a new directory under the current directory and 
//    immediately adds the directories dot (.) and dotdot (..) to it.
//    Note that the parent (..) of / is / itself.  It is an error
//    if the entry already exists.
// mkfile -
//    Create a new empty text file with the given name.  Error if
//    a dirent with that name exists.

class directory : public base_file {
private:
     // Must be a map, not unordered_map, so printing is lexicographic
     map<string, inode_ptr> dirents;
public:
     //~directory() = default;
     directory(map<string, inode_ptr> d);
     directory();
     virtual size_t size() const override;
     virtual const wordvec& readfile() const override;
     virtual void writefile(const wordvec& newdata) override;
     virtual void remove(const string& filename) override;
     virtual inode_ptr mkdir(const string& dirname) override;
     virtual inode_ptr mkfile(const string& filename) override;
     virtual map<string, inode_ptr> getDirents() override;
     virtual void setDirents(map<string, inode_ptr> newDirents) override;
     virtual void init_dir(inode_ptr current, inode_ptr parent) override;

     //directory operator= (const directory& that);
};

#endif

