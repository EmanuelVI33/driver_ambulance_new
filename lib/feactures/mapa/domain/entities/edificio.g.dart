// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edificio.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEdificioCollection on Isar {
  IsarCollection<Edificio> get edificios => this.collection();
}

const EdificioSchema = CollectionSchema(
  name: r'Edificio',
  id: -450897138401219983,
  properties: {
    r'codEdificio': PropertySchema(
      id: 0,
      name: r'codEdificio',
      type: IsarType.string,
    ),
    r'descripcion': PropertySchema(
      id: 1,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'grupo': PropertySchema(
      id: 2,
      name: r'grupo',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 3,
      name: r'id',
      type: IsarType.long,
    ),
    r'latitud': PropertySchema(
      id: 4,
      name: r'latitud',
      type: IsarType.double,
    ),
    r'localidad': PropertySchema(
      id: 5,
      name: r'localidad',
      type: IsarType.string,
    ),
    r'longitud': PropertySchema(
      id: 6,
      name: r'longitud',
      type: IsarType.double,
    ),
    r'sigla': PropertySchema(
      id: 7,
      name: r'sigla',
      type: IsarType.string,
    )
  },
  estimateSize: _edificioEstimateSize,
  serialize: _edificioSerialize,
  deserialize: _edificioDeserialize,
  deserializeProp: _edificioDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _edificioGetId,
  getLinks: _edificioGetLinks,
  attach: _edificioAttach,
  version: '3.1.0+1',
);

int _edificioEstimateSize(
  Edificio object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.codEdificio.length * 3;
  bytesCount += 3 + object.descripcion.length * 3;
  bytesCount += 3 + object.grupo.length * 3;
  bytesCount += 3 + object.localidad.length * 3;
  bytesCount += 3 + object.sigla.length * 3;
  return bytesCount;
}

void _edificioSerialize(
  Edificio object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.codEdificio);
  writer.writeString(offsets[1], object.descripcion);
  writer.writeString(offsets[2], object.grupo);
  writer.writeLong(offsets[3], object.id);
  writer.writeDouble(offsets[4], object.latitud);
  writer.writeString(offsets[5], object.localidad);
  writer.writeDouble(offsets[6], object.longitud);
  writer.writeString(offsets[7], object.sigla);
}

Edificio _edificioDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Edificio(
    codEdificio: reader.readString(offsets[0]),
    descripcion: reader.readString(offsets[1]),
    grupo: reader.readString(offsets[2]),
    id: reader.readLong(offsets[3]),
    latitud: reader.readDouble(offsets[4]),
    localidad: reader.readString(offsets[5]),
    longitud: reader.readDouble(offsets[6]),
    sigla: reader.readString(offsets[7]),
  );
  object.isarId = id;
  return object;
}

P _edificioDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _edificioGetId(Edificio object) {
  return object.isarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _edificioGetLinks(Edificio object) {
  return [];
}

void _edificioAttach(IsarCollection<dynamic> col, Id id, Edificio object) {
  object.isarId = id;
}

extension EdificioQueryWhereSort on QueryBuilder<Edificio, Edificio, QWhere> {
  QueryBuilder<Edificio, Edificio, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EdificioQueryWhere on QueryBuilder<Edificio, Edificio, QWhereClause> {
  QueryBuilder<Edificio, Edificio, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EdificioQueryFilter
    on QueryBuilder<Edificio, Edificio, QFilterCondition> {
  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> codEdificioEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codEdificio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition>
      codEdificioGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codEdificio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> codEdificioLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codEdificio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> codEdificioBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codEdificio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> codEdificioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'codEdificio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> codEdificioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'codEdificio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> codEdificioContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codEdificio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> codEdificioMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codEdificio',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> codEdificioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codEdificio',
        value: '',
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition>
      codEdificioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codEdificio',
        value: '',
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> descripcionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition>
      descripcionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> descripcionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> descripcionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descripcion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> descripcionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> descripcionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> descripcionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> descripcionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition>
      descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> grupoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> grupoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> grupoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> grupoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grupo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> grupoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> grupoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> grupoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> grupoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grupo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> grupoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grupo',
        value: '',
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> grupoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grupo',
        value: '',
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> isarIdEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> isarIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> isarIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> isarIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> latitudEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitud',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> latitudGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitud',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> latitudLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitud',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> latitudBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitud',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> localidadEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> localidadGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> localidadLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> localidadBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localidad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> localidadStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'localidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> localidadEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'localidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> localidadContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'localidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> localidadMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'localidad',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> localidadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localidad',
        value: '',
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition>
      localidadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'localidad',
        value: '',
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> longitudEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitud',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> longitudGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitud',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> longitudLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitud',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> longitudBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitud',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> siglaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sigla',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> siglaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sigla',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> siglaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sigla',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> siglaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sigla',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> siglaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sigla',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> siglaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sigla',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> siglaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sigla',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> siglaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sigla',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> siglaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sigla',
        value: '',
      ));
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterFilterCondition> siglaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sigla',
        value: '',
      ));
    });
  }
}

extension EdificioQueryObject
    on QueryBuilder<Edificio, Edificio, QFilterCondition> {}

extension EdificioQueryLinks
    on QueryBuilder<Edificio, Edificio, QFilterCondition> {}

extension EdificioQuerySortBy on QueryBuilder<Edificio, Edificio, QSortBy> {
  QueryBuilder<Edificio, Edificio, QAfterSortBy> sortByCodEdificio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codEdificio', Sort.asc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> sortByCodEdificioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codEdificio', Sort.desc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> sortByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> sortByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> sortByGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupo', Sort.asc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> sortByGrupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupo', Sort.desc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> sortByLatitud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitud', Sort.asc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> sortByLatitudDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitud', Sort.desc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> sortByLocalidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localidad', Sort.asc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> sortByLocalidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localidad', Sort.desc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> sortByLongitud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitud', Sort.asc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> sortByLongitudDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitud', Sort.desc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> sortBySigla() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sigla', Sort.asc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> sortBySiglaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sigla', Sort.desc);
    });
  }
}

extension EdificioQuerySortThenBy
    on QueryBuilder<Edificio, Edificio, QSortThenBy> {
  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenByCodEdificio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codEdificio', Sort.asc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenByCodEdificioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codEdificio', Sort.desc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenByGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupo', Sort.asc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenByGrupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupo', Sort.desc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenByLatitud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitud', Sort.asc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenByLatitudDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitud', Sort.desc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenByLocalidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localidad', Sort.asc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenByLocalidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localidad', Sort.desc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenByLongitud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitud', Sort.asc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenByLongitudDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitud', Sort.desc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenBySigla() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sigla', Sort.asc);
    });
  }

  QueryBuilder<Edificio, Edificio, QAfterSortBy> thenBySiglaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sigla', Sort.desc);
    });
  }
}

extension EdificioQueryWhereDistinct
    on QueryBuilder<Edificio, Edificio, QDistinct> {
  QueryBuilder<Edificio, Edificio, QDistinct> distinctByCodEdificio(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codEdificio', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Edificio, Edificio, QDistinct> distinctByDescripcion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Edificio, Edificio, QDistinct> distinctByGrupo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grupo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Edificio, Edificio, QDistinct> distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<Edificio, Edificio, QDistinct> distinctByLatitud() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitud');
    });
  }

  QueryBuilder<Edificio, Edificio, QDistinct> distinctByLocalidad(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localidad', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Edificio, Edificio, QDistinct> distinctByLongitud() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitud');
    });
  }

  QueryBuilder<Edificio, Edificio, QDistinct> distinctBySigla(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sigla', caseSensitive: caseSensitive);
    });
  }
}

extension EdificioQueryProperty
    on QueryBuilder<Edificio, Edificio, QQueryProperty> {
  QueryBuilder<Edificio, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Edificio, String, QQueryOperations> codEdificioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codEdificio');
    });
  }

  QueryBuilder<Edificio, String, QQueryOperations> descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<Edificio, String, QQueryOperations> grupoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grupo');
    });
  }

  QueryBuilder<Edificio, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Edificio, double, QQueryOperations> latitudProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitud');
    });
  }

  QueryBuilder<Edificio, String, QQueryOperations> localidadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localidad');
    });
  }

  QueryBuilder<Edificio, double, QQueryOperations> longitudProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitud');
    });
  }

  QueryBuilder<Edificio, String, QQueryOperations> siglaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sigla');
    });
  }
}
