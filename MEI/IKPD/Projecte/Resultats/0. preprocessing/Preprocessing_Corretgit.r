# 0. Define the project root directory

# 1. Read the dataset
dades <- read.table("/home/fuming/javaKlassv22/klassIKPD/dades/car_preprocessed.csv", 
                    header=TRUE, 
                    sep=",", dec=".",
                    stringsAsFactors=TRUE)

# 2. Rename columns to avoid issues with spaces or special characters
colnames(dades) <- c(
  "ID", "CityMPG", "Class", "CombinedMPG", "Cylinders", 
  "Displacement", "Drive", "FuelType", "HighwayMPG", 
  "Brand", "Model", "Transmission", "Year"
)

# 3. Simplify values in the 'Class' column for consistency and readability
dades$Class <- gsub("midsize car", "Midsize", dades$Class)
dades$Class <- gsub("small sport utility vehicle", "SUV Small", dades$Class)
dades$Class <- gsub("subcompact car", "Subcompact", dades$Class)
dades$Class <- gsub("large car", "Large", dades$Class)
dades$Class <- gsub("two seater", "Two-Seater", dades$Class)
dades$Class <- gsub("minicompact car", "Minicompact", dades$Class)
dades$Class <- gsub("standard sport utility vehicle", "SUV Standard", dades$Class)
dades$Class <- gsub("compact car", "Compact", dades$Class)
dades$Class <- gsub("small station wagon", "Wagon Small", dades$Class)
dades$Class <- gsub("standard pickup truck", "Pickup Standard", dades$Class)
dades$Class <- gsub("minivan", "Minivan", dades$Class)
dades$Class <- gsub("small pickup truck", "Pickup Small", dades$Class)
dades$Class <- gsub("midsize station wagon", "Wagon Midsize", dades$Class)

# 4. Simplify values in the 'Model' column for consistency and readability
dades$Model <- gsub("f-type v8 s convertible", "F-Type V8 Conv", dades$Model)
dades$Model <- gsub("f-type r awd coupe", "F-Type R AWD Coupe", dades$Model)
dades$Model <- gsub("john cooper works convertible", "Cooper JCW Conv", dades$Model)
dades$Model <- gsub("mustang convertible", "Mustang Conv", dades$Model)
dades$Model <- gsub("forester awd", "Forester AWD", dades$Model)
dades$Model <- gsub("cx-5 2wd", "CX-5 2WD", dades$Model)
dades$Model <- gsub("cx-5 4wd", "CX-5 4WD", dades$Model)
dades$Model <- gsub("escalade esv 2wd", "Escalade ESV 2WD", dades$Model)
dades$Model <- gsub("sierra c15 2wd", "Sierra 2WD", dades$Model)
dades$Model <- gsub("tt roadster quattro", "TT Roadster Quattro", dades$Model)
dades$Model <- gsub("f-type v8 s convertible", "F-Type V8 Conv", dades$Model)
dades$Model <- gsub("f-type r awd coupe", "F-Type R AWD Coupe", dades$Model)
dades$Model <- gsub("john cooper works convertible", "Cooper JCW Conv", dades$Model)
dades$Model <- gsub("mustang convertible", "Mustang Conv", dades$Model)
dades$Model <- gsub("forester awd", "Forester AWD", dades$Model)
dades$Model <- gsub("cx-5 2wd", "CX-5 2WD", dades$Model)
dades$Model <- gsub("cx-5 4wd", "CX-5 4WD", dades$Model)
dades$Model <- gsub("escalade esv 2wd", "Escalade ESV 2WD", dades$Model)
dades$Model <- gsub("sierra c15 2wd", "Sierra 2WD", dades$Model)
dades$Model <- gsub("tt roadster quattro", "TT Roadster", dades$Model)
dades$Model <- gsub("tt coupe quattro", "TT Coupe", dades$Model)
dades$Model <- gsub("grand cherokee srt8", "Cherokee SRT8", dades$Model)
dades$Model <- gsub("elantra gt", "Elantra GT", dades$Model)
dades$Model <- gsub("range rover velar", "Velar", dades$Model)
dades$Model <- gsub("cooper hardtop 2 door", "Cooper 2D", dades$Model)
dades$Model <- gsub("cooper hardtop 4 door", "Cooper 4D", dades$Model)
dades$Model <- gsub("f-type p450 awd r-dynamic convertible", "F-Type P450 Conv", dades$Model)
dades$Model <- gsub("f-type p450 awd r-dynamic coupe", "F-Type P450 Coupe", dades$Model)
dades$Model <- gsub("escalade esv 4wd", "Escalade 4WD", dades$Model)
dades$Model <- gsub("840i gran coupe", "840i Gran Coupe", dades$Model)
dades$Model <- gsub("defender 90 mhev", "Defender 90", dades$Model)
dades$Model <- gsub("sportage hybrid awd", "Sportage Hybrid AWD", dades$Model)
dades$Model <- gsub("tucson hybrid blue", "Tucson Hybrid", dades$Model)
dades$Model <- gsub("murano crosscabriolet", "Murano Cabrio", dades$Model)
dades$Model <- gsub("f-type convertible", "F-Type Conv", dades$Model)
dades$Model <- gsub("f-type coupe", "F-Type Coupe", dades$Model)
dades$Model <- gsub("cayenne turbo", "Cayenne Turbo", dades$Model)
dades$Model <- gsub("x2 xdrive28i", "X2 28i AWD", dades$Model)
dades$Model <- gsub("x2 m35i", "X2 M35i", dades$Model)
dades$Model <- gsub("m8 competition gran coupe", "M8 Gran Coupe", dades$Model)
dades$Model <- gsub("discovery sport", "Discovery Sport", dades$Model)
dades$Model <- gsub("eclipse cross 2wd", "Eclipse 2WD", dades$Model)
dades$Model <- gsub("eclipse cross 4wd", "Eclipse 4WD", dades$Model)
dades$Model <- gsub("range rover evoque", "Evoque", dades$Model)
dades$Model <- gsub("trailblazer awd", "Trailblazer AWD", dades$Model)
dades$Model <- gsub("trailblazer fwd", "Trailblazer FWD", dades$Model)
dades$Model <- gsub("john cooper works hardtop 2 door", "JCW 2D", dades$Model)
dades$Model <- gsub("john cooper works hardtop", "JCW", dades$Model)
dades$Model <- gsub("m4 competition m xdrive coupe", "M4 Comp Coupe", dades$Model)
dades$Model <- gsub("m4 competition m xdrive convertible", "M4 Comp Conv", dades$Model)
dades$Model <- gsub("alpina b8 gran coupe", "Alpina B8", dades$Model)
dades$Model <- gsub("tucson hybrid blue", "Tucson Hybrid", dades$Model)
dades$Model <- gsub("discovery mhev", "Discovery Hybrid", dades$Model)
dades$Model <- gsub("f-pace 30t", "F-Pace 30T", dades$Model)
dades$Model <- gsub("gle450 4matic", "GLE450 AWD", dades$Model)
dades$Model <- gsub("defender 110 mhev", "Defender 110", dades$Model)
dades$Model <- gsub("1500 4wd", "Ram 1500 4WD", dades$Model)
dades$Model <- gsub("1500 2wd", "Ram 1500 2WD", dades$Model)

# 5. Capitalize the first letter of each word in all text columns
capitalize_words <- function(x) {
  if (is.character(x)) {
    x <- gsub("\\b(\\w)", "\\U\\1", x, perl=TRUE)
  }
  return(x)
}

dades <- as.data.frame(lapply(dades, function(col) {
  if (is.character(col)) {
    col <- capitalize_words(col)
  }
  return(col)
}), stringsAsFactors=TRUE)

# 6. Remove problematic characters in all columns to ensure compatibility
for (k in 1:ncol(dades)) {
  if (is.factor(dades[,k])){
    dades[, k] <- gsub(" ", "-", dades[, k])
    dades[, k] <- gsub("&", "-", dades[, k])
    dades[, k] <- gsub("_", "-", dades[, k])
    dades[, k] <- gsub("\\\\", "-", dades[, k])
    dades[, k] <- gsub("/", "-", dades[, k])
    dades[, k] <- gsub("\\*", "-", dades[, k])
    dades[, k] <- gsub("'", "-", dades[, k])
    dades[, k] <- gsub(";", "-", dades[, k])
  }
}

# 7. Replace NA values: '?' for categorical variables, '0' for numeric variables
for (col_name in names(dades)) {
  if (is.factor(dades[[col_name]]) || is.character(dades[[col_name]])) {
    dades[[col_name]][is.na(dades[[col_name]])] <- '?'
  } else if (is.numeric(dades[[col_name]]) || is.integer(dades[[col_name]])) {
    dades[[col_name]][is.na(dades[[col_name]])] <- 0
  }
}

# 8. Output
nom <- "CarKlass13"
output_folder <- file.path(getwd(), "KLASSFiles")
if (!dir.exists(output_folder)) {
  dir.create(output_folder)
}

# 9. Save the .dat file for KLASS
FitxerDat <- data.frame("((", dades, "))")
write.table(FitxerDat, file.path(output_folder, paste(nom, ".dat", sep="")),
            dec=".", sep=" ", row.names=FALSE, col.names=FALSE, quote=FALSE, na='?')

# 10. Save the .obj file for KLASS
n <- dim(dades)[1]
FitxerObj <- paste("((", c(1:n), paste("o", c(1:n), sep=""), "1.0) NIL )")
# Replace any NA values with '?'
FitxerObj[is.na(FitxerObj)] <- '?'
write.table(FitxerObj, file.path(output_folder, paste(nom, ".obj", sep="")),
            dec=".", sep=" ", row.names=FALSE, col.names=FALSE, quote=FALSE, na='?')

# 11. Save the .pro file for KLASS
props <- NULL
K <- dim(dades)[2]
for (k in 1:K) {
  if (is.numeric(dades[, k]) || is.integer(dades[, k])) {
    # Since NAs in numeric columns have been replaced with 0, min and max will be computed correctly
    min_val <- min(dades[, k], na.rm=TRUE)
    max_val <- max(dades[, k], na.rm=TRUE)
    # Handle case where all values are NA (which is now 0)
    if (is.infinite(min_val)) min_val <- '0'
    if (is.infinite(max_val)) max_val <- '0'
    props[k] <- paste("((", k, names(dades)[k], ") ( (", min_val, max_val, ") 1", n, "C NIL)))")
  } else {
    # Levels already have NAs replaced with '?'
    nivells <- unique(dades[, k])
    props[k] <- paste("((", k, names(dades)[k], ") ( NIL 1", n, "Q (", paste(nivells, collapse=" "), "))))")
  }
}
# Replace any NA values in props with '?'
props[is.na(props)] <- '?'
write.table(props, file.path(output_folder, paste(nom, ".pro", sep="")),
            dec=".", sep=" ", row.names=FALSE, col.names=FALSE, quote=FALSE, na='?')
