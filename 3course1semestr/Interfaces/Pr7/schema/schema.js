const graphql = require('graphql');
const _ = require("lodash");
const { 
    GraphQLObjectType,
    GraphQLID,
    GraphQLString,
    GraphQLNonNull,
    GraphQLList,
    GraphQLSchema
  } = require('graphql');


const books = [
    {
        id: "1",
        name: "Harry Potter",
        genre: "Fantasy",
        authorId:"1"
    },
    {
        id: "2",
        name: "Приключение желтого чемоданчика",
        genre: "Fantasy",
        authorId:"2"
    },
    {
        id: "3",
        name: "Война и мир",
        genre: "Роман-эпопея",
        authorId:"3"
    }
];
const authors = [
    {
        id: "1",
        name: "Джоан Роулинг"
    },
    {
        id: "2",
        name: "Прокофьев Умка"
    },
    {
        id: "3",
        name: "Лев Николаевич Толстой"
    }
];
    
  
const BookType = new GraphQLObjectType({
    name: "Book",
    fields: () => ({
        id: { type: GraphQLID },
        name: { type: GraphQLString },
        genre: { type: GraphQLString },
        author: { type: AuthorType, resolve(parent, args) {
            return _.find(authors, { id: parent.authorId });
        }}
    })
});

const AuthorType = new GraphQLObjectType({
    name: "Author",
    fields: () => ({
        id: { type: GraphQLID },
        name: { type: GraphQLString },
    })
});

const RootQuery = new GraphQLObjectType({
    name: 'RootQueryType',
    fields: {
        book: {
            type: BookType,
            args: { id: { type: GraphQLID } },
            resolve(parent, args) {
                return _.find(books, { id: args.id });
            }
        },
        books: {
            type : new graphql.GraphQLList(BookType),
            resolve(parent, args){
                return books;
            }
        },
        author:{
            type: AuthorType,
            args: { id: { type: GraphQLID } },
            resolve(parent, args) {
                return _.find(authors, { id: args.id });
            }
        },
        authors:{
            type : new graphql.GraphQLList(AuthorType),
            resolve(parent, args){
                return authors;
            }
        }
    }
});

const Mutations = new GraphQLObjectType({
    name: 'Mutations',
    fields: {
        addauthor: {
        type: AuthorType,
        args: {
            id: { type: new GraphQLNonNull(GraphQLID) },
            name: { type: GraphQLString}
        },
        resolve(parent,args) {
                const arrLength = authors.push(args);
                return authors [arrLength - 1];
            }
        },
        addbook: {
            type: BookType,
            args: {
                id: { type: new GraphQLNonNull(GraphQLID) },
                name: { type: GraphQLString},
                genre: {type: GraphQLString},
                authorId: {type: new GraphQLNonNull(GraphQLID)}
            },
            resolve(parent,args) {
                    const arrLength = books.push(args);
                    return books[arrLength - 1];
                }
            }, 
        }
    }
);
module.exports = new GraphQLSchema({
    query: RootQuery,
    mutation: Mutations
});