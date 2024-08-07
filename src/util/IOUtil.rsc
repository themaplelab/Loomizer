module util::IOUtil

import IO;
import String;


/**
 * List all Java files from an original location. 
 */
list[loc] findAllJavaFiles(loc location, str ext) {
  res = [];
  list[loc] allFiles = []; 
  if(isDirectory(location)) {
    allFiles = location.ls;
  }
  else {
    allFiles = [location];
  }

  for(loc l <- allFiles) {
    if(isDirectory(l)) {
      res = res + (findAllJavaFiles(l, ext));
    }
    else {
      if(l.extension == ext && l.file != "package-info.java" ) {
        res = l + res;
      };
    };
  };
  return res; 
}